#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {
	MENU_HELP,
	MENU_UNKNOWN
} menu_action;

menu_action menu(char *arg);
void help(int argc, char **argv);

int main(int argc, char **argv) {

	puts("Welcome to the early version of this useless example :)");

	if (argc < 2) {
		printf("Please supply a command.\nType \"%s help\" for more commands.\n",
			argv[0]
		);

		return EXIT_FAILURE;
	}

	switch(menu(argv[1])) {
	case MENU_HELP:
		help(argc, argv);
		break;
	case MENU_UNKNOWN:
	default:
		printf("Unknown command %s.\n", argv[1]);

		return EXIT_FAILURE;
	}

	return EXIT_SUCCESS;
}

menu_action menu(char *arg) {
	if (strcmp(arg, "help") == 0) {
		return MENU_HELP;
	}

	return MENU_UNKNOWN;
}

void help(int argc, char **argv) {
	puts("No help yet!");
}
