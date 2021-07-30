//REG:GET 2 NUMBERS AND PRINT TWO NUMBER'S  ADD,SUBTRACTION,MALTIPILE,AND DEVIDE VALUE

#include <stdio.h>

int main(){
int q;
int w;
printf("First Number ");
scanf("%d",&q);
printf("\nSecond Number ");
scanf("%d",&w);
int r=q+w;
printf("\n\tTwo Number Add Result %d",r);
int a=q-w;
printf("\n\tTwo Number Minus  Result %d",a);
int s=q*w;
printf("\n\tTwo Number Maltipile   Result %d",s);
int d=q/w;
printf("\n\tTwo Number Divide  Result %d",d);
}
