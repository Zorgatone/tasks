#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include "util.h"

void die(const char *format, ...) {
	char *err = "Error: ";
	char *errformat = malloc(strlen(err) + strlen(format) + 2);

	strcpy(errformat, err);
	strcat(errformat, format);
	strcat(errformat, "\n");

	va_list args;
	va_start (args, format);
	vfprintf(stderr, errformat, args);
	va_end (args);

	free(errformat);
	exit(EXIT_FAILURE);
}
