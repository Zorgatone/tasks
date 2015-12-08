#include <stdio.h>
#include <stdlib.h>

#include "util/util.h"
#include "menu/menu.h"

int main(int argc, char **argv) {
	puts("Welcome to the early version of this useless example :)");

	if (argc < 2)
		die("Please supply a command.\nType \"%s help\" for more commands.",
			argv[0]
		);

	switch(menu(argv[1])) {
	case MENU_HELP:
		help(argc, argv);
		break;
	case MENU_UNKNOWN:
	default:
		die("Unknown command %s.", argv[1]);
	}

	return EXIT_SUCCESS;
}
