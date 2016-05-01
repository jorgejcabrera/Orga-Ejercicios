/*
 ============================================================================
 Name        : Factorial.c
 Author      : Jorge
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

unsigned int  factorial (unsigned int n){
	if (n < 2)
		return 1;
	else
		return n*factorial(n-1);
}

int main(void) {
	printf("%d",factorial(5));
	return EXIT_SUCCESS;
}
