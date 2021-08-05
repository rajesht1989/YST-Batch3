//REQUIREMENT:GET THREE NUMBER FROM USER AND PRINT MALTIPLYCATION VALUE
int getNumberFromUser(){
    int value;
    printf("ENTER YOUR NUMBER ");                                           //GET THREE NUMBER FROM USER AND PRINT MALTIPLYCATION VALUE
    scanf("%d",&value);
    return value;
}
int maltipilThreeNumber(int first,int second,int third){
    return first*second*third;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int result=maltipilThreeNumber(a,b,c);
    printf("MALTIPLYCATION VALUE IS %d",result);
}

//REQUIREMENT:GET TOW NUMBER FROM USER AND PRINT MALTIPLYCATION VALUE
int getNumberFromUser(){
    int value;                                                                //GET TWO NUMBER FROM USER AND PRINT MALTIPLYCATION VALUE
    printf("ENTER YOUR NUMBER ");
    scanf("%d",&value);
    return value;
}
int maltipilTwoNumber(int first,int second){
    return first*second;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int result=maltipilTwoNumber(a,b);
    printf("MALTIPLYCATION VALUE IS %d",result);
}
