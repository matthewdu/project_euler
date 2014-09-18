#include <stdio.h>

int main(void) {

    int i = 0;
    int a = 0;
    while (i < 1000) {
	if (i%3 == 0) {
	    a += i;
	    }
	else if (i%5 == 0) {
	    a += i;
	    }
    i++;
    }
    printf("%d\n", a);
    return(0);

}
