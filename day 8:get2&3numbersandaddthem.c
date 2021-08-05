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


