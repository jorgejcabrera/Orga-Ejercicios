/*
 ============================================================================
 Name        : StrRev.c
 Author      : Jorge
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*char* strrev(char *p){
	char *s = p;
	char *e = p + strlen(p) - 1;
	while (s < e){
		char a = *s;
		*s = *e;
		*e = a;
		s++, e--;
	}
	return p;
}*/

extern char* strrev(char *s);

int main(void) {
	char* myString = "this";
	char* revString = strrev(myString);
	printf("%c\n",revString[0]);
	return EXIT_SUCCESS;
}
