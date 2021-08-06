//Requirement:Get 3 numbers from user and add them and print on console

#include <stdio.h>
void main (){
    int i=getNumberFromTheUser();
    int j=getNumberFromTheUser();
    int k=getNumberFromTheUser();
    int l=add(i,j);
    int m=add(l+k);
    printf("Addition %d",m );
}

int getNumberFromTheUser(){
printf ("Enter the number");
int v;
scanf ("%d",&v);
return v;
}

int add(int firstnumber,int secondnumber,int thirdnumber)
{return firstnumber+secondnumber+thirdnumber;}
