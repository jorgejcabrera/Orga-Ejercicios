/*
 ============================================================================
 Name        : MyStrlen.c
 Author      : Jorge
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int my_strlen_utf8_c(char *s){
	int i = 0, j = 0;
	while (s[i]) {
		if ((s[i] & 0xc0) != 0x80) j++;
		i++;
	}
	return j;
}

int main(void) {
	char* myString = "my string is too long";
	int myStringLen = my_strlen_utf8_c(myString);
	printf("%d\n", myStringLen);

	return EXIT_SUCCESS;
}
