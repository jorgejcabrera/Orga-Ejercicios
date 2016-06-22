/*
 ============================================================================
 Name        : StrnLen.c
 Author      : Jorge
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*size_t strnlen(const char *s, size_t maxlen){
	size_t len;
	for (len = 0; len < maxlen; len++, s++) {
		if (!*s)
			break;
	}
	return (len);
}*/

extern size_t strnlen(const char *s, size_t maxlen);

int main(void) {
	const char* myString = "this is my string";
	printf("%d\n",strnlen(myString,100));
	return EXIT_SUCCESS;
}
