// GET NUMBER FROM USER AND IDENTIFY 2ND LOWEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter A Number ");
    scanf("%d",&number);
    return number;
}
int lowNumber(int a,int b,int c){
    if(a<b && a<c){
        return a;
    }
    else if(b<c){
        return b;
    }
    else {
        return c;
    }
}
int LowNumber(int a,int b,int c){
    int low=lowNumber(a,b,c);
    if(low==a){
        return b;
    }
    else if(low==b){
        return c;
    }
    else if(low==c){
        return a;
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int n=LowNumber(a,b,c);
    printf("2nd Lowest Number is %d",n);
}
