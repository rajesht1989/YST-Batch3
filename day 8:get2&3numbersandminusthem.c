//REQUIREMENT:GET TWO NUMBER FROM USER AND PRINT SUBTRACTION VALUE
int getNumberFromUser(){                                
    int value;
    printf("ENTER YOUR NUMBER ");                                      //GET TWO NUMBER FROM USER AND PRINT SUBTRACTION VALUE
    scanf("%d",&value);
    return value;
}
int minusTwoNumber(int first,int second){
    return first-second;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=minusTwoNumber(a,b);
    printf("SUBTRACTION VALUE IS %d",c);
}

//REQUIREMENT:GET THREE NUMBER FROM USER AND PRINT SUBTRACTION VALUE
int getNumberFromUser(){
    int value;
    printf("ENTER YOUR NUMBER ");                                      //GET THREE NUMBER FROM USER AND PRINT SUBTRACTION VALUE
    scanf("%d",&value);
    return value;
}
int minusThreeNumber(int first,int second,int third){
    return first-second-third;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int result=minusThreeNumber(a,b,c);
    printf("SUBTRACTION VALUE IS %d",result);
}
