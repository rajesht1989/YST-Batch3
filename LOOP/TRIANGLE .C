//REQUIREMENT:INVERTED TRIANGLE SHAPE PRINT ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter a Number ");
    scanf("%d",&number);
    return number;
}
void drawFor(int a){
    for(int j=1;j<=a;j++)
    {
    for(int i=a;i>=j;i--)
    {
        printf("*\t");
    }
    printf("\n");
    }
}
#include<stdio.h>
void main(){
    drawFor(getNumberFromUser());
}
