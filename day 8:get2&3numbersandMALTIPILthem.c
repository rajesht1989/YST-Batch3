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

//REQUIREMENT:GET 4 NUMBER FROM USER AND PRINT MALTIPIL VALUE
int getNumberFromUser(){
    int value;
    printf("ENTER YOUR NUMBER ");                                           //GET 4 NUMBER FROM USER AND PRINT MALTIPIL VALUE
    scanf("%d",&value);
    return value;
}
int maltipilFourNumber(int first,int second,int third,int four){
    return first*second*third*four;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int d=getNumberFromUser();
    int result=maltipilFourNumber(a,b,c,d);
    printf("MALTIPIL VALUE IS %d",result);
}
