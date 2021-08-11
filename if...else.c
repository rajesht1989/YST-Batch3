//REQUIREMENT:GET 3 NUMBER FROM USER  AND IDENTIFY BIGGEST NUMBUR AND PRINT ON CONSOLE
int getNumberFromUser(){
    int value;
    printf("Enter a Number ");
    scanf("%d",&value);
    return value;
}
int biggestValue(int a,int b,int c){
    if(a>b){
        return a;
    }
    else {
        return b;
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    printf("Biggest value is %d",biggestValue(a,b,c));
}
