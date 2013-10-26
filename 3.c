#include <stdio.h>
#include <math.h>

void factor(unsigned long number){
	printf("%lu = ", number);
	for(unsigned long i=2; i!=number;){
		if(number%i==0){
			printf("%lu*", i);
			number /= i;
		}
		else i++;
	}
	printf("%lu", number);
}

void main(void){
	factor(600851475143);
}