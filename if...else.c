int getNumberFromUser(){
    int value;
    printf("Enter a Number ");
    scanf("%d",&value);
    return value;
}
int biggestValue(int a,int b,int c){
    if(a>b&&a>c){
        return a;
    }
    else {
        if(b>c){
            return b;
        }
        else{
        return c;
        }
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    printf("Biggest value is %d",biggestValue(a,b,c));
    return c;
}
