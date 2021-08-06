//Requirement: Get two numbers from the user and add them and print them on the console
#include <stdio.h>
void main () {
int i = getNumberfromtheuser();
int j = getNumberfromtheuser();
int k=add(i,j);
printf("Addition of number is %d", k);
}

int getNumberfromtheuser () {
printf ("Enter a Number ");
int v;
scanf ("%d", &v);
return v;
}
int add (int firstno, int secondno)
{
return firstno+secondno;
}
