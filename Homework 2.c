//REQUIREMENT:GET 2 NUMBERS FROM USER AND SUBTRACT THEM AND PRINT ON CONSOLE
#include<stdio.h>
void main(){
int i=getNumberFromTheUser();
int j=getNumberFromTheUser();
int k=subtract(i,j);
printf("subtract%d",k);
}

int getNumberFromTheUser(){
printf("Enter the number");
int v;
scanf("%d",&v);
return v;
}

int subtract(int firstnumber, int secondnumber)
{return firstnumber*secondnumber;}
