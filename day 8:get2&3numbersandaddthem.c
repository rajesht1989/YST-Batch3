//REQUIREMENT:GET TWO NUMBER FROM USER
int getNumberFromUser(){
    int v;
    printf("Enter a Number ");
    scanf("%d",&v);
    return v;                                                //GET TWO NUMBERS FROM USER
}
int add(int a,int b){
    return a+b;
}
#include<stdio.h> 
int main(){
int a=getNumberFromUser();
int b=getNumberFromUser();
int r=add(a,b);
printf("value of addition is %d",r);
}

//REQUIREMENT:GET THREE NUMBER FROM USER AND ADD THEM             
int getNumberFromUser(){                                     //GET THREE NUMBER FROM USER AND ADD THEM 
    int c;
    printf("Enter a Number ");
    scanf("%d",&c);
    return c;
}
int add(int firstnumber,int secondnumber,int thirdnumber){
    return firstnumber+secondnumber+thirdnumber;
}
#include<stdio.h>
int main(){
    int firstnumber=getNumberFromUser();
    int secondnumber=getNumberFromUser();
    int thirdnumber=getNumberFromUser();
    int v=add(firstnumber,secondnumber,thirdnumber);
    printf("VALUE OF ADDITION %d",v);
}

//REQUIREMENT:GET 4 NUMBER FROM USER AND PRINT ADD VALUE
int getNumberFromUser(){
    int value;
    printf("ENTER YOUR NUMBER ");                                           //GET 4 NUMBER FROM USER AND PRINT ADD VALUE
    scanf("%d",&value);
    return value;
}
int addFourNumber(int first,int second,int third,int four){
    return first+second+third+four;
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int d=getNumberFromUser();
    int result=addFourNumber(a,b,c,d);
    printf("ADD VALUE IS %d",result);
}
