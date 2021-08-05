//REQUIREMENT:GET THREE NUMBER FROM USER AND PRINT DIVISION VALUE
int getNumberFromUser(){
    int value;
    printf("ENTER YOUR NUMBER ");                                           //GET THREE NUMBER FROM USER AND PRINT DIVISION VALUE
    scanf("%d",&value);
    return value;
}
int divideThreeNumber(int first,int second,int third){
    return first/second/third;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int result=divideThreeNumber(a,b,c);
    printf("DIVIDE VALUE IS %d",result);
}


//REQUIREMENT:GET TOW NUMBER FROM USER AND PRINT DIVISION VALUE
int getNumberFromUser(){
    int value;                                                                //GET TWO NUMBER FROM USER AND PRINT DIVISION VALUE
    printf("ENTER YOUR NUMBER ");
    scanf("%d",&value);
    return value;
}
int divideTwoNumber(int first,int second){
    return first/second;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int result=divideTwoNumber(a,b);
    printf("DIVIDE VALUE IS %d",result);
}

