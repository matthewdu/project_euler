#include <stdio.h>

int main(){
	int a = 1;
	for(int i = 1; i <= 20; i++){
		if(a%i == 0) continue;
		else{a += 1; i = 1;}
	}
	printf("%d\n", a);
	return 0;
}