#include <stdio.h>

int main() {

    int a = 1;
    int b = 1;
    int c = 0;
    int sum = 0;
    while ( a < 4000000) {
	c = b;
	b = a;
	a = b+c;
	if ( a%2 == 0) {
	sum += a;
	}
    }

    printf("%d\n", sum);
    return(0);
}
