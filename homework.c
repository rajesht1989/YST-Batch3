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

//FLOAT

//REG:GET 2 DECIMAL NUMBERS AND PRINT  ADD,SUBTRACTION,MALTIPILE,AND DEVIDE DECIMAL TWO NUMBER'S  VALUE

#include <stdio.h>

int main(){
float q;
float w;
printf("First Decimal Number ");
scanf("%f",&q);
printf("\nSecond Decimal Number ");
scanf("%f",&w);
float r=q+w;
printf("\n\tTwo Decimal Number Add Result %f",r);
float a=q-w;
printf("\n\tTwo Decimal Number Minus  Result %f",a);
float s=q*w;
printf("\n\tTwo Decimal Number Maltipil   Result %f",s);
float d=q/w;
printf("\n\tTwo Decimal Number Divide  Result %f",d);
}

