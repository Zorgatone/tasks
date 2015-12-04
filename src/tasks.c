#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

typedef enum {
	MENU_HELP,
	MENU_UNKNOWN
} menu_action;

void die(const char * format, ...);
menu_action menu(char *arg);
void help(int argc, char **argv);

int main(int argc, char **argv) {
	puts("Welcome to the early version of this useless example :)");

	if (argc < 2)
		die("Please supply a command.\nType \"%s help\" for more commands.\n",
			argv[0]
		);

	switch(menu(argv[1])) {
	case MENU_HELP:
		help(argc, argv);
		break;
	case MENU_UNKNOWN:
	default:
		die("Unknown command %s.\n", argv[1]);
	}

	return EXIT_SUCCESS;
}

void die(const char *format, ...) {
	va_list args;
	va_start (args, format);
	vfprintf(stderr, format, args);
	va_end (args);

	exit(EXIT_FAILURE);
}

menu_action menu(char *arg) {
	if (strcmp(arg, "help") == 0) {
		return MENU_HELP;
	}

	return MENU_UNKNOWN;
}

void help(int argc, char **argv) {
	die("No help yet!");
}
