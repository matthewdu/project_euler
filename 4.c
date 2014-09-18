#include <stdio.h>
#include <string.h>
#include "strrev.c"
#include <stdlib.h>
 
int isPalindrome(int num){

   char a[6];
   sprintf(a, "%d", num);
   char b[sizeof(a)/sizeof(a[0])];
   strcpy(b,a);
   strrev(b);
 
   if( strcmp(a,b) == 0 ) return 1;
   else return 0;
}

int main(){
   for(int i = 999; i>99; i--){
      for(int j= 999; j>99; j--){
         if(isPalindrome(i*j)) printf("%d\n", i*j);
      }
   }
   return 0;
}

//use grep pipe