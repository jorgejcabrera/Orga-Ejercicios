/*
 ============================================================================
 Name        : WcharWithLen.c
 Author      : Jorge
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

typedef unsigned int pg_wchar;

/*static int pg_ascii2wchar_with_len(const unsigned char *from, pg_wchar *to, int len){
	int cnt = 0;
	while (len > 0 && *from){
		*to++ = *from++;
		len--;
		cnt++;
	}
	*to = 0;
	return cnt;
}*/

extern int pg_ascii2wchar_with_len(const unsigned char *from, pg_wchar *to, int len);

int main(void) {
	const unsigned char* from = "HOLA";
	pg_wchar to = 2;
	printf("%d\n",pg_ascii2wchar_with_len(from,&to,5));
	return EXIT_SUCCESS;
}
